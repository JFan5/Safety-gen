(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v2 ?v12)
             (pred_1 ?v7 ?v6)
             (pred_5 ?v2 ?v6)
             (pred_6 ?v3 ?v2 )
	     (pred_3 ?v2)
             (pred_11 ?v11)
             (pred_12 ?v7)
             (pred_7 ?v6)
             (pred_9 ?v2)
             (pred_2 ?v7)
             (pred_10 ?v2)
             (pred_8 ))



(:action op_2
:parameters (?v5 ?v13 ?v8 ?v10)
:precondition (and (pred_11 ?v5) (pred_11 ?v13) (pred_12 ?v8) (pred_7 ?v10)
          (pred_4 ?v5 ?v13) (pred_1 ?v8 ?v10)
                   (pred_5 ?v13 ?v10) (pred_3 ?v5) 
                   (pred_9 ?v13) (pred_2 ?v8))
:effect (and  (pred_10 ?v13) (not (pred_9 ?v13))))


(:action op_1
:parameters (?v5 ?v4)
:precondition (and (pred_11 ?v5) (pred_11 ?v4)
               (pred_3 ?v5) (pred_4 ?v5 ?v4) (pred_10 ?v4))
:effect (and (pred_3 ?v4) (not (pred_3 ?v5))))

(:action op_4
:parameters (?v5 ?v8)
:precondition (and (pred_11 ?v5) (pred_12 ?v8) 
                  (pred_3 ?v5) (pred_6 ?v8 ?v5) (pred_8 ))
:effect (and (pred_2 ?v8)
   (not (pred_6 ?v8 ?v5)) (not (pred_8 ))))


(:action op_3
:parameters (?v5 ?v1 ?v9)
:precondition (and (pred_11 ?v5) (pred_12 ?v1) (pred_12 ?v9)
                  (pred_3 ?v5) (pred_2 ?v9) (pred_6 ?v1 ?v5))
:effect (and (pred_2 ?v1) (pred_6 ?v9 ?v5)
        (not (pred_2 ?v9)) (not (pred_6 ?v1 ?v5))))

(:action op_5
:parameters (?v5 ?v8)
:precondition (and (pred_11 ?v5) (pred_12 ?v8) 
                  (pred_3 ?v5) (pred_2 ?v8))
:effect (and (pred_8 ) (pred_6 ?v8 ?v5) (not (pred_2 ?v8)))))


	
