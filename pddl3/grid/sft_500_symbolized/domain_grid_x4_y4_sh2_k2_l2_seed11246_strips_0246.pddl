(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v1 ?v12)
             (pred_7 ?v2 ?v8)
             (pred_2 ?v1 ?v8)
             (pred_11 ?v6 ?v1 )
	     (pred_3 ?v1)
             (pred_12 ?v13)
             (pred_9 ?v2)
             (pred_4 ?v8)
             (pred_8 ?v1)
             (pred_5 ?v2)
             (pred_6 ?v1)
             (pred_1 ))



(:action op_4
:parameters (?v10 ?v5 ?v9 ?v4)
:precondition (and (pred_12 ?v10) (pred_12 ?v5) (pred_9 ?v9) (pred_4 ?v4)
          (pred_10 ?v10 ?v5) (pred_7 ?v9 ?v4)
                   (pred_2 ?v5 ?v4) (pred_3 ?v10) 
                   (pred_8 ?v5) (pred_5 ?v9))
:effect (and  (pred_6 ?v5) (not (pred_8 ?v5))))


(:action op_2
:parameters (?v10 ?v7)
:precondition (and (pred_12 ?v10) (pred_12 ?v7)
               (pred_3 ?v10) (pred_10 ?v10 ?v7) (pred_6 ?v7))
:effect (and (pred_3 ?v7) (not (pred_3 ?v10))))

(:action op_3
:parameters (?v10 ?v9)
:precondition (and (pred_12 ?v10) (pred_9 ?v9) 
                  (pred_3 ?v10) (pred_11 ?v9 ?v10) (pred_1 ))
:effect (and (pred_5 ?v9)
   (not (pred_11 ?v9 ?v10)) (not (pred_1 ))))


(:action op_5
:parameters (?v10 ?v3 ?v11)
:precondition (and (pred_12 ?v10) (pred_9 ?v3) (pred_9 ?v11)
                  (pred_3 ?v10) (pred_5 ?v11) (pred_11 ?v3 ?v10))
:effect (and (pred_5 ?v3) (pred_11 ?v11 ?v10)
        (not (pred_5 ?v11)) (not (pred_11 ?v3 ?v10))))

(:action op_1
:parameters (?v10 ?v9)
:precondition (and (pred_12 ?v10) (pred_9 ?v9) 
                  (pred_3 ?v10) (pred_5 ?v9))
:effect (and (pred_1 ) (pred_11 ?v9 ?v10) (not (pred_5 ?v9)))))


	
