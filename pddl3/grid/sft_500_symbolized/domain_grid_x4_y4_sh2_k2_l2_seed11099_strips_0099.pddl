(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v3 ?v10)
             (pred_2 ?v1 ?v12)
             (pred_4 ?v3 ?v12)
             (pred_12 ?v9 ?v3 )
	     (pred_5 ?v3)
             (pred_1 ?v8)
             (pred_10 ?v1)
             (pred_9 ?v12)
             (pred_6 ?v3)
             (pred_7 ?v1)
             (pred_3 ?v3)
             (pred_8 ))



(:action op_2
:parameters (?v11 ?v2 ?v4 ?v7)
:precondition (and (pred_1 ?v11) (pred_1 ?v2) (pred_10 ?v4) (pred_9 ?v7)
          (pred_11 ?v11 ?v2) (pred_2 ?v4 ?v7)
                   (pred_4 ?v2 ?v7) (pred_5 ?v11) 
                   (pred_6 ?v2) (pred_7 ?v4))
:effect (and  (pred_3 ?v2) (not (pred_6 ?v2))))


(:action op_3
:parameters (?v11 ?v13)
:precondition (and (pred_1 ?v11) (pred_1 ?v13)
               (pred_5 ?v11) (pred_11 ?v11 ?v13) (pred_3 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v11))))

(:action op_1
:parameters (?v11 ?v4)
:precondition (and (pred_1 ?v11) (pred_10 ?v4) 
                  (pred_5 ?v11) (pred_12 ?v4 ?v11) (pred_8 ))
:effect (and (pred_7 ?v4)
   (not (pred_12 ?v4 ?v11)) (not (pred_8 ))))


(:action op_5
:parameters (?v11 ?v5 ?v6)
:precondition (and (pred_1 ?v11) (pred_10 ?v5) (pred_10 ?v6)
                  (pred_5 ?v11) (pred_7 ?v6) (pred_12 ?v5 ?v11))
:effect (and (pred_7 ?v5) (pred_12 ?v6 ?v11)
        (not (pred_7 ?v6)) (not (pred_12 ?v5 ?v11))))

(:action op_4
:parameters (?v11 ?v4)
:precondition (and (pred_1 ?v11) (pred_10 ?v4) 
                  (pred_5 ?v11) (pred_7 ?v4))
:effect (and (pred_8 ) (pred_12 ?v4 ?v11) (not (pred_7 ?v4)))))


	
