(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v11 ?v6)
             (pred_7 ?v7 ?v1)
             (pred_11 ?v11 ?v1)
             (pred_4 ?v2 ?v11 )
	     (pred_1 ?v11)
             (pred_6 ?v4)
             (pred_8 ?v7)
             (pred_9 ?v1)
             (pred_10 ?v11)
             (pred_5 ?v7)
             (pred_3 ?v11)
             (pred_2 ))



(:action op_4
:parameters (?v13 ?v8 ?v12 ?v5)
:precondition (and (pred_6 ?v13) (pred_6 ?v8) (pred_8 ?v12) (pred_9 ?v5)
          (pred_12 ?v13 ?v8) (pred_7 ?v12 ?v5)
                   (pred_11 ?v8 ?v5) (pred_1 ?v13) 
                   (pred_10 ?v8) (pred_5 ?v12))
:effect (and  (pred_3 ?v8) (not (pred_10 ?v8))))


(:action op_5
:parameters (?v13 ?v10)
:precondition (and (pred_6 ?v13) (pred_6 ?v10)
               (pred_1 ?v13) (pred_12 ?v13 ?v10) (pred_3 ?v10))
:effect (and (pred_1 ?v10) (not (pred_1 ?v13))))

(:action op_1
:parameters (?v13 ?v12)
:precondition (and (pred_6 ?v13) (pred_8 ?v12) 
                  (pred_1 ?v13) (pred_4 ?v12 ?v13) (pred_2 ))
:effect (and (pred_5 ?v12)
   (not (pred_4 ?v12 ?v13)) (not (pred_2 ))))


(:action op_3
:parameters (?v13 ?v3 ?v9)
:precondition (and (pred_6 ?v13) (pred_8 ?v3) (pred_8 ?v9)
                  (pred_1 ?v13) (pred_5 ?v9) (pred_4 ?v3 ?v13))
:effect (and (pred_5 ?v3) (pred_4 ?v9 ?v13)
        (not (pred_5 ?v9)) (not (pred_4 ?v3 ?v13))))

(:action op_2
:parameters (?v13 ?v12)
:precondition (and (pred_6 ?v13) (pred_8 ?v12) 
                  (pred_1 ?v13) (pred_5 ?v12))
:effect (and (pred_2 ) (pred_4 ?v12 ?v13) (not (pred_5 ?v12)))))


	
