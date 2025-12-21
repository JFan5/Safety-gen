(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v2 ?v7)
             (pred_9 ?v11 ?v3)
             (pred_7 ?v2 ?v3)
             (pred_4 ?v12 ?v2 )
	     (pred_6 ?v2)
             (pred_12 ?v1)
             (pred_1 ?v11)
             (pred_11 ?v3)
             (pred_5 ?v2)
             (pred_2 ?v11)
             (pred_10 ?v2)
             (pred_3 ))



(:action op_3
:parameters (?v5 ?v10 ?v13 ?v4)
:precondition (and (pred_12 ?v5) (pred_12 ?v10) (pred_1 ?v13) (pred_11 ?v4)
          (pred_8 ?v5 ?v10) (pred_9 ?v13 ?v4)
                   (pred_7 ?v10 ?v4) (pred_6 ?v5) 
                   (pred_5 ?v10) (pred_2 ?v13))
:effect (and  (pred_10 ?v10) (not (pred_5 ?v10))))


(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_12 ?v5) (pred_12 ?v9)
               (pred_6 ?v5) (pred_8 ?v5 ?v9) (pred_10 ?v9))
:effect (and (pred_6 ?v9) (not (pred_6 ?v5))))

(:action op_5
:parameters (?v5 ?v13)
:precondition (and (pred_12 ?v5) (pred_1 ?v13) 
                  (pred_6 ?v5) (pred_4 ?v13 ?v5) (pred_3 ))
:effect (and (pred_2 ?v13)
   (not (pred_4 ?v13 ?v5)) (not (pred_3 ))))


(:action op_1
:parameters (?v5 ?v6 ?v8)
:precondition (and (pred_12 ?v5) (pred_1 ?v6) (pred_1 ?v8)
                  (pred_6 ?v5) (pred_2 ?v8) (pred_4 ?v6 ?v5))
:effect (and (pred_2 ?v6) (pred_4 ?v8 ?v5)
        (not (pred_2 ?v8)) (not (pred_4 ?v6 ?v5))))

(:action op_2
:parameters (?v5 ?v13)
:precondition (and (pred_12 ?v5) (pred_1 ?v13) 
                  (pred_6 ?v5) (pred_2 ?v13))
:effect (and (pred_3 ) (pred_4 ?v13 ?v5) (not (pred_2 ?v13)))))


	
