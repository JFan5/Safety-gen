(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v3 ?v12)
             (pred_6 ?v6 ?v5)
             (pred_8 ?v3 ?v5)
             (pred_11 ?v2 ?v3 )
	     (pred_4 ?v3)
             (pred_12 ?v11)
             (pred_1 ?v6)
             (pred_5 ?v5)
             (pred_3 ?v3)
             (pred_2 ?v6)
             (pred_7 ?v3)
             (pred_10 ))



(:action op_4
:parameters (?v10 ?v1 ?v4 ?v13)
:precondition (and (pred_12 ?v10) (pred_12 ?v1) (pred_1 ?v4) (pred_5 ?v13)
          (pred_9 ?v10 ?v1) (pred_6 ?v4 ?v13)
                   (pred_8 ?v1 ?v13) (pred_4 ?v10) 
                   (pred_3 ?v1) (pred_2 ?v4))
:effect (and  (pred_7 ?v1) (not (pred_3 ?v1))))


(:action op_3
:parameters (?v10 ?v9)
:precondition (and (pred_12 ?v10) (pred_12 ?v9)
               (pred_4 ?v10) (pred_9 ?v10 ?v9) (pred_7 ?v9))
:effect (and (pred_4 ?v9) (not (pred_4 ?v10))))

(:action op_1
:parameters (?v10 ?v4)
:precondition (and (pred_12 ?v10) (pred_1 ?v4) 
                  (pred_4 ?v10) (pred_11 ?v4 ?v10) (pred_10 ))
:effect (and (pred_2 ?v4)
   (not (pred_11 ?v4 ?v10)) (not (pred_10 ))))


(:action op_2
:parameters (?v10 ?v8 ?v7)
:precondition (and (pred_12 ?v10) (pred_1 ?v8) (pred_1 ?v7)
                  (pred_4 ?v10) (pred_2 ?v7) (pred_11 ?v8 ?v10))
:effect (and (pred_2 ?v8) (pred_11 ?v7 ?v10)
        (not (pred_2 ?v7)) (not (pred_11 ?v8 ?v10))))

(:action op_5
:parameters (?v10 ?v4)
:precondition (and (pred_12 ?v10) (pred_1 ?v4) 
                  (pred_4 ?v10) (pred_2 ?v4))
:effect (and (pred_10 ) (pred_11 ?v4 ?v10) (not (pred_2 ?v4)))))


	
