(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v12 ?v3)
             (pred_9 ?v7 ?v1)
             (pred_2 ?v12 ?v1)
             (pred_10 ?v9 ?v12 )
	     (pred_7 ?v12)
             (pred_5 ?v8)
             (pred_11 ?v7)
             (pred_6 ?v1)
             (pred_4 ?v12)
             (pred_8 ?v7)
             (pred_3 ?v12)
             (pred_1 ))



(:action op_1
:parameters (?v11 ?v5 ?v2 ?v10)
:precondition (and (pred_5 ?v11) (pred_5 ?v5) (pred_11 ?v2) (pred_6 ?v10)
          (pred_12 ?v11 ?v5) (pred_9 ?v2 ?v10)
                   (pred_2 ?v5 ?v10) (pred_7 ?v11) 
                   (pred_4 ?v5) (pred_8 ?v2))
:effect (and  (pred_3 ?v5) (not (pred_4 ?v5))))


(:action op_3
:parameters (?v11 ?v13)
:precondition (and (pred_5 ?v11) (pred_5 ?v13)
               (pred_7 ?v11) (pred_12 ?v11 ?v13) (pred_3 ?v13))
:effect (and (pred_7 ?v13) (not (pred_7 ?v11))))

(:action op_5
:parameters (?v11 ?v2)
:precondition (and (pred_5 ?v11) (pred_11 ?v2) 
                  (pred_7 ?v11) (pred_10 ?v2 ?v11) (pred_1 ))
:effect (and (pred_8 ?v2)
   (not (pred_10 ?v2 ?v11)) (not (pred_1 ))))


(:action op_4
:parameters (?v11 ?v6 ?v4)
:precondition (and (pred_5 ?v11) (pred_11 ?v6) (pred_11 ?v4)
                  (pred_7 ?v11) (pred_8 ?v4) (pred_10 ?v6 ?v11))
:effect (and (pred_8 ?v6) (pred_10 ?v4 ?v11)
        (not (pred_8 ?v4)) (not (pred_10 ?v6 ?v11))))

(:action op_2
:parameters (?v11 ?v2)
:precondition (and (pred_5 ?v11) (pred_11 ?v2) 
                  (pred_7 ?v11) (pred_8 ?v2))
:effect (and (pred_1 ) (pred_10 ?v2 ?v11) (not (pred_8 ?v2)))))


	
