(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v11)
             (pred_12 ?v5 ?v4)
             (pred_7 ?v6 ?v4)
             (pred_3 ?v2 ?v6 )
	     (pred_4 ?v6)
             (pred_9 ?v12)
             (pred_1 ?v5)
             (pred_2 ?v4)
             (pred_11 ?v6)
             (pred_6 ?v5)
             (pred_8 ?v6)
             (pred_5 ))



(:action op_4
:parameters (?v13 ?v8 ?v10 ?v9)
:precondition (and (pred_9 ?v13) (pred_9 ?v8) (pred_1 ?v10) (pred_2 ?v9)
          (pred_10 ?v13 ?v8) (pred_12 ?v10 ?v9)
                   (pred_7 ?v8 ?v9) (pred_4 ?v13) 
                   (pred_11 ?v8) (pred_6 ?v10))
:effect (and  (pred_8 ?v8) (not (pred_11 ?v8))))


(:action op_3
:parameters (?v13 ?v3)
:precondition (and (pred_9 ?v13) (pred_9 ?v3)
               (pred_4 ?v13) (pred_10 ?v13 ?v3) (pred_8 ?v3))
:effect (and (pred_4 ?v3) (not (pred_4 ?v13))))

(:action op_5
:parameters (?v13 ?v10)
:precondition (and (pred_9 ?v13) (pred_1 ?v10) 
                  (pred_4 ?v13) (pred_3 ?v10 ?v13) (pred_5 ))
:effect (and (pred_6 ?v10)
   (not (pred_3 ?v10 ?v13)) (not (pred_5 ))))


(:action op_2
:parameters (?v13 ?v7 ?v1)
:precondition (and (pred_9 ?v13) (pred_1 ?v7) (pred_1 ?v1)
                  (pred_4 ?v13) (pred_6 ?v1) (pred_3 ?v7 ?v13))
:effect (and (pred_6 ?v7) (pred_3 ?v1 ?v13)
        (not (pred_6 ?v1)) (not (pred_3 ?v7 ?v13))))

(:action op_1
:parameters (?v13 ?v10)
:precondition (and (pred_9 ?v13) (pred_1 ?v10) 
                  (pred_4 ?v13) (pred_6 ?v10))
:effect (and (pred_5 ) (pred_3 ?v10 ?v13) (not (pred_6 ?v10)))))


	
