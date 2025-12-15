(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v7 ?v5)
             (pred_1 ?v3 ?v4)
             (pred_7 ?v7 ?v4)
             (pred_12 ?v2 ?v7 )
	     (pred_6 ?v7)
             (pred_4 ?v10)
             (pred_3 ?v3)
             (pred_2 ?v4)
             (pred_11 ?v7)
             (pred_8 ?v3)
             (pred_5 ?v7)
             (pred_9 ))



(:action op_1
:parameters (?v12 ?v13 ?v1 ?v11)
:precondition (and (pred_4 ?v12) (pred_4 ?v13) (pred_3 ?v1) (pred_2 ?v11)
          (pred_10 ?v12 ?v13) (pred_1 ?v1 ?v11)
                   (pred_7 ?v13 ?v11) (pred_6 ?v12) 
                   (pred_11 ?v13) (pred_8 ?v1))
:effect (and  (pred_5 ?v13) (not (pred_11 ?v13))))


(:action op_2
:parameters (?v12 ?v8)
:precondition (and (pred_4 ?v12) (pred_4 ?v8)
               (pred_6 ?v12) (pred_10 ?v12 ?v8) (pred_5 ?v8))
:effect (and (pred_6 ?v8) (not (pred_6 ?v12))))

(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_4 ?v12) (pred_3 ?v1) 
                  (pred_6 ?v12) (pred_12 ?v1 ?v12) (pred_9 ))
:effect (and (pred_8 ?v1)
   (not (pred_12 ?v1 ?v12)) (not (pred_9 ))))


(:action op_4
:parameters (?v12 ?v6 ?v9)
:precondition (and (pred_4 ?v12) (pred_3 ?v6) (pred_3 ?v9)
                  (pred_6 ?v12) (pred_8 ?v9) (pred_12 ?v6 ?v12))
:effect (and (pred_8 ?v6) (pred_12 ?v9 ?v12)
        (not (pred_8 ?v9)) (not (pred_12 ?v6 ?v12))))

(:action op_3
:parameters (?v12 ?v1)
:precondition (and (pred_4 ?v12) (pred_3 ?v1) 
                  (pred_6 ?v12) (pred_8 ?v1))
:effect (and (pred_9 ) (pred_12 ?v1 ?v12) (not (pred_8 ?v1)))))


	
