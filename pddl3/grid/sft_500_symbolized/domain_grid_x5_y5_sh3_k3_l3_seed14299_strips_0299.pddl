(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v7 ?v12)
             (pred_9 ?v11 ?v4)
             (pred_12 ?v7 ?v4)
             (pred_4 ?v6 ?v7 )
	     (pred_7 ?v7)
             (pred_1 ?v5)
             (pred_11 ?v11)
             (pred_10 ?v4)
             (pred_5 ?v7)
             (pred_3 ?v11)
             (pred_8 ?v7)
             (pred_6 ))



(:action op_1
:parameters (?v13 ?v8 ?v9 ?v1)
:precondition (and (pred_1 ?v13) (pred_1 ?v8) (pred_11 ?v9) (pred_10 ?v1)
          (pred_2 ?v13 ?v8) (pred_9 ?v9 ?v1)
                   (pred_12 ?v8 ?v1) (pred_7 ?v13) 
                   (pred_5 ?v8) (pred_3 ?v9))
:effect (and  (pred_8 ?v8) (not (pred_5 ?v8))))


(:action op_5
:parameters (?v13 ?v10)
:precondition (and (pred_1 ?v13) (pred_1 ?v10)
               (pred_7 ?v13) (pred_2 ?v13 ?v10) (pred_8 ?v10))
:effect (and (pred_7 ?v10) (not (pred_7 ?v13))))

(:action op_4
:parameters (?v13 ?v9)
:precondition (and (pred_1 ?v13) (pred_11 ?v9) 
                  (pred_7 ?v13) (pred_4 ?v9 ?v13) (pred_6 ))
:effect (and (pred_3 ?v9)
   (not (pred_4 ?v9 ?v13)) (not (pred_6 ))))


(:action op_3
:parameters (?v13 ?v2 ?v3)
:precondition (and (pred_1 ?v13) (pred_11 ?v2) (pred_11 ?v3)
                  (pred_7 ?v13) (pred_3 ?v3) (pred_4 ?v2 ?v13))
:effect (and (pred_3 ?v2) (pred_4 ?v3 ?v13)
        (not (pred_3 ?v3)) (not (pred_4 ?v2 ?v13))))

(:action op_2
:parameters (?v13 ?v9)
:precondition (and (pred_1 ?v13) (pred_11 ?v9) 
                  (pred_7 ?v13) (pred_3 ?v9))
:effect (and (pred_6 ) (pred_4 ?v9 ?v13) (not (pred_3 ?v9)))))


	
