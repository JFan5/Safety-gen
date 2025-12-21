(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v2 ?v6)
             (pred_10 ?v4 ?v12)
             (pred_12 ?v2 ?v12)
             (pred_9 ?v13 ?v2 )
	     (pred_2 ?v2)
             (pred_5 ?v5)
             (pred_1 ?v4)
             (pred_11 ?v12)
             (pred_8 ?v2)
             (pred_4 ?v4)
             (pred_3 ?v2)
             (pred_6 ))



(:action op_1
:parameters (?v11 ?v9 ?v1 ?v8)
:precondition (and (pred_5 ?v11) (pred_5 ?v9) (pred_1 ?v1) (pred_11 ?v8)
          (pred_7 ?v11 ?v9) (pred_10 ?v1 ?v8)
                   (pred_12 ?v9 ?v8) (pred_2 ?v11) 
                   (pred_8 ?v9) (pred_4 ?v1))
:effect (and  (pred_3 ?v9) (not (pred_8 ?v9))))


(:action op_4
:parameters (?v11 ?v10)
:precondition (and (pred_5 ?v11) (pred_5 ?v10)
               (pred_2 ?v11) (pred_7 ?v11 ?v10) (pred_3 ?v10))
:effect (and (pred_2 ?v10) (not (pred_2 ?v11))))

(:action op_2
:parameters (?v11 ?v1)
:precondition (and (pred_5 ?v11) (pred_1 ?v1) 
                  (pred_2 ?v11) (pred_9 ?v1 ?v11) (pred_6 ))
:effect (and (pred_4 ?v1)
   (not (pred_9 ?v1 ?v11)) (not (pred_6 ))))


(:action op_3
:parameters (?v11 ?v3 ?v7)
:precondition (and (pred_5 ?v11) (pred_1 ?v3) (pred_1 ?v7)
                  (pred_2 ?v11) (pred_4 ?v7) (pred_9 ?v3 ?v11))
:effect (and (pred_4 ?v3) (pred_9 ?v7 ?v11)
        (not (pred_4 ?v7)) (not (pred_9 ?v3 ?v11))))

(:action op_5
:parameters (?v11 ?v1)
:precondition (and (pred_5 ?v11) (pred_1 ?v1) 
                  (pred_2 ?v11) (pred_4 ?v1))
:effect (and (pred_6 ) (pred_9 ?v1 ?v11) (not (pred_4 ?v1)))))


	
