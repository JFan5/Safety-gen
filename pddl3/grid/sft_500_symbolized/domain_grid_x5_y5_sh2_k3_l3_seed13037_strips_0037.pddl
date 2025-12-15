(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v11 ?v7)
             (pred_8 ?v6 ?v5)
             (pred_3 ?v11 ?v5)
             (pred_4 ?v4 ?v11 )
	     (pred_7 ?v11)
             (pred_5 ?v9)
             (pred_10 ?v6)
             (pred_2 ?v5)
             (pred_11 ?v11)
             (pred_9 ?v6)
             (pred_12 ?v11)
             (pred_6 ))



(:action op_2
:parameters (?v13 ?v8 ?v12 ?v1)
:precondition (and (pred_5 ?v13) (pred_5 ?v8) (pred_10 ?v12) (pred_2 ?v1)
          (pred_1 ?v13 ?v8) (pred_8 ?v12 ?v1)
                   (pred_3 ?v8 ?v1) (pred_7 ?v13) 
                   (pred_11 ?v8) (pred_9 ?v12))
:effect (and  (pred_12 ?v8) (not (pred_11 ?v8))))


(:action op_4
:parameters (?v13 ?v3)
:precondition (and (pred_5 ?v13) (pred_5 ?v3)
               (pred_7 ?v13) (pred_1 ?v13 ?v3) (pred_12 ?v3))
:effect (and (pred_7 ?v3) (not (pred_7 ?v13))))

(:action op_1
:parameters (?v13 ?v12)
:precondition (and (pred_5 ?v13) (pred_10 ?v12) 
                  (pred_7 ?v13) (pred_4 ?v12 ?v13) (pred_6 ))
:effect (and (pred_9 ?v12)
   (not (pred_4 ?v12 ?v13)) (not (pred_6 ))))


(:action op_5
:parameters (?v13 ?v10 ?v2)
:precondition (and (pred_5 ?v13) (pred_10 ?v10) (pred_10 ?v2)
                  (pred_7 ?v13) (pred_9 ?v2) (pred_4 ?v10 ?v13))
:effect (and (pred_9 ?v10) (pred_4 ?v2 ?v13)
        (not (pred_9 ?v2)) (not (pred_4 ?v10 ?v13))))

(:action op_3
:parameters (?v13 ?v12)
:precondition (and (pred_5 ?v13) (pred_10 ?v12) 
                  (pred_7 ?v13) (pred_9 ?v12))
:effect (and (pred_6 ) (pred_4 ?v12 ?v13) (not (pred_9 ?v12)))))


	
