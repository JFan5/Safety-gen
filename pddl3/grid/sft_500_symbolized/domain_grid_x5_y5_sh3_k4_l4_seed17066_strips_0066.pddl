(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v9)
             (pred_9 ?v7 ?v3)
             (pred_7 ?v11 ?v3)
             (pred_12 ?v5 ?v11 )
	     (pred_1 ?v11)
             (pred_11 ?v6)
             (pred_8 ?v7)
             (pred_3 ?v3)
             (pred_6 ?v11)
             (pred_4 ?v7)
             (pred_2 ?v11)
             (pred_5 ))



(:action op_5
:parameters (?v13 ?v12 ?v8 ?v1)
:precondition (and (pred_11 ?v13) (pred_11 ?v12) (pred_8 ?v8) (pred_3 ?v1)
          (pred_10 ?v13 ?v12) (pred_9 ?v8 ?v1)
                   (pred_7 ?v12 ?v1) (pred_1 ?v13) 
                   (pred_6 ?v12) (pred_4 ?v8))
:effect (and  (pred_2 ?v12) (not (pred_6 ?v12))))


(:action op_1
:parameters (?v13 ?v4)
:precondition (and (pred_11 ?v13) (pred_11 ?v4)
               (pred_1 ?v13) (pred_10 ?v13 ?v4) (pred_2 ?v4))
:effect (and (pred_1 ?v4) (not (pred_1 ?v13))))

(:action op_2
:parameters (?v13 ?v8)
:precondition (and (pred_11 ?v13) (pred_8 ?v8) 
                  (pred_1 ?v13) (pred_12 ?v8 ?v13) (pred_5 ))
:effect (and (pred_4 ?v8)
   (not (pred_12 ?v8 ?v13)) (not (pred_5 ))))


(:action op_4
:parameters (?v13 ?v10 ?v2)
:precondition (and (pred_11 ?v13) (pred_8 ?v10) (pred_8 ?v2)
                  (pred_1 ?v13) (pred_4 ?v2) (pred_12 ?v10 ?v13))
:effect (and (pred_4 ?v10) (pred_12 ?v2 ?v13)
        (not (pred_4 ?v2)) (not (pred_12 ?v10 ?v13))))

(:action op_3
:parameters (?v13 ?v8)
:precondition (and (pred_11 ?v13) (pred_8 ?v8) 
                  (pred_1 ?v13) (pred_4 ?v8))
:effect (and (pred_5 ) (pred_12 ?v8 ?v13) (not (pred_4 ?v8)))))


	
