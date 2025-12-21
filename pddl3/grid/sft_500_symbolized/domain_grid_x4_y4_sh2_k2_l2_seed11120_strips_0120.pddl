(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v2 ?v8)
             (pred_5 ?v12 ?v13)
             (pred_3 ?v2 ?v13)
             (pred_10 ?v1 ?v2 )
	     (pred_2 ?v2)
             (pred_1 ?v3)
             (pred_7 ?v12)
             (pred_12 ?v13)
             (pred_11 ?v2)
             (pred_9 ?v12)
             (pred_8 ?v2)
             (pred_6 ))



(:action op_5
:parameters (?v5 ?v10 ?v4 ?v11)
:precondition (and (pred_1 ?v5) (pred_1 ?v10) (pred_7 ?v4) (pred_12 ?v11)
          (pred_4 ?v5 ?v10) (pred_5 ?v4 ?v11)
                   (pred_3 ?v10 ?v11) (pred_2 ?v5) 
                   (pred_11 ?v10) (pred_9 ?v4))
:effect (and  (pred_8 ?v10) (not (pred_11 ?v10))))


(:action op_2
:parameters (?v5 ?v9)
:precondition (and (pred_1 ?v5) (pred_1 ?v9)
               (pred_2 ?v5) (pred_4 ?v5 ?v9) (pred_8 ?v9))
:effect (and (pred_2 ?v9) (not (pred_2 ?v5))))

(:action op_1
:parameters (?v5 ?v4)
:precondition (and (pred_1 ?v5) (pred_7 ?v4) 
                  (pred_2 ?v5) (pred_10 ?v4 ?v5) (pred_6 ))
:effect (and (pred_9 ?v4)
   (not (pred_10 ?v4 ?v5)) (not (pred_6 ))))


(:action op_4
:parameters (?v5 ?v6 ?v7)
:precondition (and (pred_1 ?v5) (pred_7 ?v6) (pred_7 ?v7)
                  (pred_2 ?v5) (pred_9 ?v7) (pred_10 ?v6 ?v5))
:effect (and (pred_9 ?v6) (pred_10 ?v7 ?v5)
        (not (pred_9 ?v7)) (not (pred_10 ?v6 ?v5))))

(:action op_3
:parameters (?v5 ?v4)
:precondition (and (pred_1 ?v5) (pred_7 ?v4) 
                  (pred_2 ?v5) (pred_9 ?v4))
:effect (and (pred_6 ) (pred_10 ?v4 ?v5) (not (pred_9 ?v4)))))


	
