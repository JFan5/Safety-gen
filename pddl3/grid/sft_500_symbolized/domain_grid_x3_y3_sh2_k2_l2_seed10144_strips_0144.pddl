(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v13 ?v4)
             (pred_8 ?v5 ?v2)
             (pred_12 ?v13 ?v2)
             (pred_11 ?v1 ?v13 )
	     (pred_7 ?v13)
             (pred_1 ?v8)
             (pred_2 ?v5)
             (pred_3 ?v2)
             (pred_10 ?v13)
             (pred_5 ?v5)
             (pred_6 ?v13)
             (pred_4 ))



(:action op_2
:parameters (?v10 ?v6 ?v3 ?v7)
:precondition (and (pred_1 ?v10) (pred_1 ?v6) (pred_2 ?v3) (pred_3 ?v7)
          (pred_9 ?v10 ?v6) (pred_8 ?v3 ?v7)
                   (pred_12 ?v6 ?v7) (pred_7 ?v10) 
                   (pred_10 ?v6) (pred_5 ?v3))
:effect (and  (pred_6 ?v6) (not (pred_10 ?v6))))


(:action op_1
:parameters (?v10 ?v12)
:precondition (and (pred_1 ?v10) (pred_1 ?v12)
               (pred_7 ?v10) (pred_9 ?v10 ?v12) (pred_6 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v10))))

(:action op_5
:parameters (?v10 ?v3)
:precondition (and (pred_1 ?v10) (pred_2 ?v3) 
                  (pred_7 ?v10) (pred_11 ?v3 ?v10) (pred_4 ))
:effect (and (pred_5 ?v3)
   (not (pred_11 ?v3 ?v10)) (not (pred_4 ))))


(:action op_3
:parameters (?v10 ?v9 ?v11)
:precondition (and (pred_1 ?v10) (pred_2 ?v9) (pred_2 ?v11)
                  (pred_7 ?v10) (pred_5 ?v11) (pred_11 ?v9 ?v10))
:effect (and (pred_5 ?v9) (pred_11 ?v11 ?v10)
        (not (pred_5 ?v11)) (not (pred_11 ?v9 ?v10))))

(:action op_4
:parameters (?v10 ?v3)
:precondition (and (pred_1 ?v10) (pred_2 ?v3) 
                  (pred_7 ?v10) (pred_5 ?v3))
:effect (and (pred_4 ) (pred_11 ?v3 ?v10) (not (pred_5 ?v3)))))


	
