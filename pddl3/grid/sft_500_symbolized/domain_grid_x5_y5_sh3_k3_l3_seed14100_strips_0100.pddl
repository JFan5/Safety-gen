(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v13 ?v9)
             (pred_2 ?v5 ?v11)
             (pred_4 ?v13 ?v11)
             (pred_11 ?v8 ?v13 )
	     (pred_1 ?v13)
             (pred_5 ?v2)
             (pred_7 ?v5)
             (pred_8 ?v11)
             (pred_6 ?v13)
             (pred_9 ?v5)
             (pred_10 ?v13)
             (pred_12 ))



(:action op_4
:parameters (?v10 ?v7 ?v3 ?v1)
:precondition (and (pred_5 ?v10) (pred_5 ?v7) (pred_7 ?v3) (pred_8 ?v1)
          (pred_3 ?v10 ?v7) (pred_2 ?v3 ?v1)
                   (pred_4 ?v7 ?v1) (pred_1 ?v10) 
                   (pred_6 ?v7) (pred_9 ?v3))
:effect (and  (pred_10 ?v7) (not (pred_6 ?v7))))


(:action op_5
:parameters (?v10 ?v4)
:precondition (and (pred_5 ?v10) (pred_5 ?v4)
               (pred_1 ?v10) (pred_3 ?v10 ?v4) (pred_10 ?v4))
:effect (and (pred_1 ?v4) (not (pred_1 ?v10))))

(:action op_1
:parameters (?v10 ?v3)
:precondition (and (pred_5 ?v10) (pred_7 ?v3) 
                  (pred_1 ?v10) (pred_11 ?v3 ?v10) (pred_12 ))
:effect (and (pred_9 ?v3)
   (not (pred_11 ?v3 ?v10)) (not (pred_12 ))))


(:action op_3
:parameters (?v10 ?v12 ?v6)
:precondition (and (pred_5 ?v10) (pred_7 ?v12) (pred_7 ?v6)
                  (pred_1 ?v10) (pred_9 ?v6) (pred_11 ?v12 ?v10))
:effect (and (pred_9 ?v12) (pred_11 ?v6 ?v10)
        (not (pred_9 ?v6)) (not (pred_11 ?v12 ?v10))))

(:action op_2
:parameters (?v10 ?v3)
:precondition (and (pred_5 ?v10) (pred_7 ?v3) 
                  (pred_1 ?v10) (pred_9 ?v3))
:effect (and (pred_12 ) (pred_11 ?v3 ?v10) (not (pred_9 ?v3)))))


	
