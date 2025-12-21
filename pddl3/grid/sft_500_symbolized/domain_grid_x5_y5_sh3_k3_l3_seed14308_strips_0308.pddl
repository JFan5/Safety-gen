(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v11 ?v4)
             (pred_3 ?v5 ?v9)
             (pred_7 ?v11 ?v9)
             (pred_5 ?v3 ?v11 )
	     (pred_10 ?v11)
             (pred_6 ?v7)
             (pred_11 ?v5)
             (pred_1 ?v9)
             (pred_12 ?v11)
             (pred_2 ?v5)
             (pred_9 ?v11)
             (pred_8 ))



(:action op_3
:parameters (?v12 ?v6 ?v2 ?v1)
:precondition (and (pred_6 ?v12) (pred_6 ?v6) (pred_11 ?v2) (pred_1 ?v1)
          (pred_4 ?v12 ?v6) (pred_3 ?v2 ?v1)
                   (pred_7 ?v6 ?v1) (pred_10 ?v12) 
                   (pred_12 ?v6) (pred_2 ?v2))
:effect (and  (pred_9 ?v6) (not (pred_12 ?v6))))


(:action op_5
:parameters (?v12 ?v10)
:precondition (and (pred_6 ?v12) (pred_6 ?v10)
               (pred_10 ?v12) (pred_4 ?v12 ?v10) (pred_9 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v12))))

(:action op_2
:parameters (?v12 ?v2)
:precondition (and (pred_6 ?v12) (pred_11 ?v2) 
                  (pred_10 ?v12) (pred_5 ?v2 ?v12) (pred_8 ))
:effect (and (pred_2 ?v2)
   (not (pred_5 ?v2 ?v12)) (not (pred_8 ))))


(:action op_4
:parameters (?v12 ?v13 ?v8)
:precondition (and (pred_6 ?v12) (pred_11 ?v13) (pred_11 ?v8)
                  (pred_10 ?v12) (pred_2 ?v8) (pred_5 ?v13 ?v12))
:effect (and (pred_2 ?v13) (pred_5 ?v8 ?v12)
        (not (pred_2 ?v8)) (not (pred_5 ?v13 ?v12))))

(:action op_1
:parameters (?v12 ?v2)
:precondition (and (pred_6 ?v12) (pred_11 ?v2) 
                  (pred_10 ?v12) (pred_2 ?v2))
:effect (and (pred_8 ) (pred_5 ?v2 ?v12) (not (pred_2 ?v2)))))


	
