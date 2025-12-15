(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v11 ?v2)
             (pred_7 ?v5 ?v6)
             (pred_4 ?v11 ?v6)
             (pred_10 ?v8 ?v11 )
	     (pred_9 ?v11)
             (pred_11 ?v9)
             (pred_3 ?v5)
             (pred_12 ?v6)
             (pred_5 ?v11)
             (pred_2 ?v5)
             (pred_8 ?v11)
             (pred_1 ))



(:action op_2
:parameters (?v12 ?v13 ?v4 ?v3)
:precondition (and (pred_11 ?v12) (pred_11 ?v13) (pred_3 ?v4) (pred_12 ?v3)
          (pred_6 ?v12 ?v13) (pred_7 ?v4 ?v3)
                   (pred_4 ?v13 ?v3) (pred_9 ?v12) 
                   (pred_5 ?v13) (pred_2 ?v4))
:effect (and  (pred_8 ?v13) (not (pred_5 ?v13))))


(:action op_1
:parameters (?v12 ?v10)
:precondition (and (pred_11 ?v12) (pred_11 ?v10)
               (pred_9 ?v12) (pred_6 ?v12 ?v10) (pred_8 ?v10))
:effect (and (pred_9 ?v10) (not (pred_9 ?v12))))

(:action op_3
:parameters (?v12 ?v4)
:precondition (and (pred_11 ?v12) (pred_3 ?v4) 
                  (pred_9 ?v12) (pred_10 ?v4 ?v12) (pred_1 ))
:effect (and (pred_2 ?v4)
   (not (pred_10 ?v4 ?v12)) (not (pred_1 ))))


(:action op_5
:parameters (?v12 ?v1 ?v7)
:precondition (and (pred_11 ?v12) (pred_3 ?v1) (pred_3 ?v7)
                  (pred_9 ?v12) (pred_2 ?v7) (pred_10 ?v1 ?v12))
:effect (and (pred_2 ?v1) (pred_10 ?v7 ?v12)
        (not (pred_2 ?v7)) (not (pred_10 ?v1 ?v12))))

(:action op_4
:parameters (?v12 ?v4)
:precondition (and (pred_11 ?v12) (pred_3 ?v4) 
                  (pred_9 ?v12) (pred_2 ?v4))
:effect (and (pred_1 ) (pred_10 ?v4 ?v12) (not (pred_2 ?v4)))))


	
