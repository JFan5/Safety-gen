(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v8 ?v12)
             (pred_5 ?v9 ?v11)
             (pred_1 ?v8 ?v11)
             (pred_7 ?v3 ?v8 )
	     (pred_9 ?v8)
             (pred_4 ?v5)
             (pred_8 ?v9)
             (pred_10 ?v11)
             (pred_12 ?v8)
             (pred_2 ?v9)
             (pred_3 ?v8)
             (pred_6 ))



(:action op_1
:parameters (?v10 ?v1 ?v4 ?v6)
:precondition (and (pred_4 ?v10) (pred_4 ?v1) (pred_8 ?v4) (pred_10 ?v6)
          (pred_11 ?v10 ?v1) (pred_5 ?v4 ?v6)
                   (pred_1 ?v1 ?v6) (pred_9 ?v10) 
                   (pred_12 ?v1) (pred_2 ?v4))
:effect (and  (pred_3 ?v1) (not (pred_12 ?v1))))


(:action op_5
:parameters (?v10 ?v13)
:precondition (and (pred_4 ?v10) (pred_4 ?v13)
               (pred_9 ?v10) (pred_11 ?v10 ?v13) (pred_3 ?v13))
:effect (and (pred_9 ?v13) (not (pred_9 ?v10))))

(:action op_3
:parameters (?v10 ?v4)
:precondition (and (pred_4 ?v10) (pred_8 ?v4) 
                  (pred_9 ?v10) (pred_7 ?v4 ?v10) (pred_6 ))
:effect (and (pred_2 ?v4)
   (not (pred_7 ?v4 ?v10)) (not (pred_6 ))))


(:action op_4
:parameters (?v10 ?v7 ?v2)
:precondition (and (pred_4 ?v10) (pred_8 ?v7) (pred_8 ?v2)
                  (pred_9 ?v10) (pred_2 ?v2) (pred_7 ?v7 ?v10))
:effect (and (pred_2 ?v7) (pred_7 ?v2 ?v10)
        (not (pred_2 ?v2)) (not (pred_7 ?v7 ?v10))))

(:action op_2
:parameters (?v10 ?v4)
:precondition (and (pred_4 ?v10) (pred_8 ?v4) 
                  (pred_9 ?v10) (pred_2 ?v4))
:effect (and (pred_6 ) (pred_7 ?v4 ?v10) (not (pred_2 ?v4)))))


	
