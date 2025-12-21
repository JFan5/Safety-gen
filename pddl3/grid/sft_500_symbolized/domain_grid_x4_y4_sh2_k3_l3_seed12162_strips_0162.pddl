(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v3)
             (pred_10 ?v5 ?v7)
             (pred_5 ?v6 ?v7)
             (pred_11 ?v11 ?v6 )
	     (pred_9 ?v6)
             (pred_2 ?v4)
             (pred_3 ?v5)
             (pred_1 ?v7)
             (pred_12 ?v6)
             (pred_4 ?v5)
             (pred_8 ?v6)
             (pred_6 ))



(:action op_4
:parameters (?v13 ?v8 ?v9 ?v1)
:precondition (and (pred_2 ?v13) (pred_2 ?v8) (pred_3 ?v9) (pred_1 ?v1)
          (pred_7 ?v13 ?v8) (pred_10 ?v9 ?v1)
                   (pred_5 ?v8 ?v1) (pred_9 ?v13) 
                   (pred_12 ?v8) (pred_4 ?v9))
:effect (and  (pred_8 ?v8) (not (pred_12 ?v8))))


(:action op_3
:parameters (?v13 ?v12)
:precondition (and (pred_2 ?v13) (pred_2 ?v12)
               (pred_9 ?v13) (pred_7 ?v13 ?v12) (pred_8 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v13))))

(:action op_5
:parameters (?v13 ?v9)
:precondition (and (pred_2 ?v13) (pred_3 ?v9) 
                  (pred_9 ?v13) (pred_11 ?v9 ?v13) (pred_6 ))
:effect (and (pred_4 ?v9)
   (not (pred_11 ?v9 ?v13)) (not (pred_6 ))))


(:action op_2
:parameters (?v13 ?v10 ?v2)
:precondition (and (pred_2 ?v13) (pred_3 ?v10) (pred_3 ?v2)
                  (pred_9 ?v13) (pred_4 ?v2) (pred_11 ?v10 ?v13))
:effect (and (pred_4 ?v10) (pred_11 ?v2 ?v13)
        (not (pred_4 ?v2)) (not (pred_11 ?v10 ?v13))))

(:action op_1
:parameters (?v13 ?v9)
:precondition (and (pred_2 ?v13) (pred_3 ?v9) 
                  (pred_9 ?v13) (pred_4 ?v9))
:effect (and (pred_6 ) (pred_11 ?v9 ?v13) (not (pred_4 ?v9)))))


	
