(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v3 ?v8)
             (pred_8 ?v6 ?v7)
             (pred_11 ?v3 ?v7)
             (pred_7 ?v5 ?v3 )
	     (pred_4 ?v3)
             (pred_2 ?v1)
             (pred_12 ?v6)
             (pred_10 ?v7)
             (pred_6 ?v3)
             (pred_9 ?v6)
             (pred_1 ?v3)
             (pred_5 ))



(:action op_5
:parameters (?v11 ?v9 ?v13 ?v2)
:precondition (and (pred_2 ?v11) (pred_2 ?v9) (pred_12 ?v13) (pred_10 ?v2)
          (pred_3 ?v11 ?v9) (pred_8 ?v13 ?v2)
                   (pred_11 ?v9 ?v2) (pred_4 ?v11) 
                   (pred_6 ?v9) (pred_9 ?v13))
:effect (and  (pred_1 ?v9) (not (pred_6 ?v9))))


(:action op_2
:parameters (?v11 ?v4)
:precondition (and (pred_2 ?v11) (pred_2 ?v4)
               (pred_4 ?v11) (pred_3 ?v11 ?v4) (pred_1 ?v4))
:effect (and (pred_4 ?v4) (not (pred_4 ?v11))))

(:action op_3
:parameters (?v11 ?v13)
:precondition (and (pred_2 ?v11) (pred_12 ?v13) 
                  (pred_4 ?v11) (pred_7 ?v13 ?v11) (pred_5 ))
:effect (and (pred_9 ?v13)
   (not (pred_7 ?v13 ?v11)) (not (pred_5 ))))


(:action op_4
:parameters (?v11 ?v10 ?v12)
:precondition (and (pred_2 ?v11) (pred_12 ?v10) (pred_12 ?v12)
                  (pred_4 ?v11) (pred_9 ?v12) (pred_7 ?v10 ?v11))
:effect (and (pred_9 ?v10) (pred_7 ?v12 ?v11)
        (not (pred_9 ?v12)) (not (pred_7 ?v10 ?v11))))

(:action op_1
:parameters (?v11 ?v13)
:precondition (and (pred_2 ?v11) (pred_12 ?v13) 
                  (pred_4 ?v11) (pred_9 ?v13))
:effect (and (pred_5 ) (pred_7 ?v13 ?v11) (not (pred_9 ?v13)))))


	
