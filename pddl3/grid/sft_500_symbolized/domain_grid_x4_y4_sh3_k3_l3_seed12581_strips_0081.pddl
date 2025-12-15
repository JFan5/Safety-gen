(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v6 ?v1)
             (pred_10 ?v10 ?v3)
             (pred_11 ?v6 ?v3)
             (pred_1 ?v7 ?v6 )
	     (pred_5 ?v6)
             (pred_12 ?v8)
             (pred_4 ?v10)
             (pred_7 ?v3)
             (pred_2 ?v6)
             (pred_8 ?v10)
             (pred_9 ?v6)
             (pred_6 ))



(:action op_5
:parameters (?v11 ?v5 ?v12 ?v4)
:precondition (and (pred_12 ?v11) (pred_12 ?v5) (pred_4 ?v12) (pred_7 ?v4)
          (pred_3 ?v11 ?v5) (pred_10 ?v12 ?v4)
                   (pred_11 ?v5 ?v4) (pred_5 ?v11) 
                   (pred_2 ?v5) (pred_8 ?v12))
:effect (and  (pred_9 ?v5) (not (pred_2 ?v5))))


(:action op_4
:parameters (?v11 ?v13)
:precondition (and (pred_12 ?v11) (pred_12 ?v13)
               (pred_5 ?v11) (pred_3 ?v11 ?v13) (pred_9 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v11))))

(:action op_2
:parameters (?v11 ?v12)
:precondition (and (pred_12 ?v11) (pred_4 ?v12) 
                  (pred_5 ?v11) (pred_1 ?v12 ?v11) (pred_6 ))
:effect (and (pred_8 ?v12)
   (not (pred_1 ?v12 ?v11)) (not (pred_6 ))))


(:action op_3
:parameters (?v11 ?v9 ?v2)
:precondition (and (pred_12 ?v11) (pred_4 ?v9) (pred_4 ?v2)
                  (pred_5 ?v11) (pred_8 ?v2) (pred_1 ?v9 ?v11))
:effect (and (pred_8 ?v9) (pred_1 ?v2 ?v11)
        (not (pred_8 ?v2)) (not (pred_1 ?v9 ?v11))))

(:action op_1
:parameters (?v11 ?v12)
:precondition (and (pred_12 ?v11) (pred_4 ?v12) 
                  (pred_5 ?v11) (pred_8 ?v12))
:effect (and (pred_6 ) (pred_1 ?v12 ?v11) (not (pred_8 ?v12)))))


	
