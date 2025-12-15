(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v8 ?v2)
             (pred_7 ?v5 ?v12)
             (pred_3 ?v8 ?v12)
             (pred_4 ?v11 ?v8 )
	     (pred_2 ?v8)
             (pred_9 ?v4)
             (pred_1 ?v5)
             (pred_11 ?v12)
             (pred_12 ?v8)
             (pred_6 ?v5)
             (pred_8 ?v8)
             (pred_5 ))



(:action op_1
:parameters (?v10 ?v7 ?v9 ?v13)
:precondition (and (pred_9 ?v10) (pred_9 ?v7) (pred_1 ?v9) (pred_11 ?v13)
          (pred_10 ?v10 ?v7) (pred_7 ?v9 ?v13)
                   (pred_3 ?v7 ?v13) (pred_2 ?v10) 
                   (pred_12 ?v7) (pred_6 ?v9))
:effect (and  (pred_8 ?v7) (not (pred_12 ?v7))))


(:action op_3
:parameters (?v10 ?v6)
:precondition (and (pred_9 ?v10) (pred_9 ?v6)
               (pred_2 ?v10) (pred_10 ?v10 ?v6) (pred_8 ?v6))
:effect (and (pred_2 ?v6) (not (pred_2 ?v10))))

(:action op_2
:parameters (?v10 ?v9)
:precondition (and (pred_9 ?v10) (pred_1 ?v9) 
                  (pred_2 ?v10) (pred_4 ?v9 ?v10) (pred_5 ))
:effect (and (pred_6 ?v9)
   (not (pred_4 ?v9 ?v10)) (not (pred_5 ))))


(:action op_4
:parameters (?v10 ?v3 ?v1)
:precondition (and (pred_9 ?v10) (pred_1 ?v3) (pred_1 ?v1)
                  (pred_2 ?v10) (pred_6 ?v1) (pred_4 ?v3 ?v10))
:effect (and (pred_6 ?v3) (pred_4 ?v1 ?v10)
        (not (pred_6 ?v1)) (not (pred_4 ?v3 ?v10))))

(:action op_5
:parameters (?v10 ?v9)
:precondition (and (pred_9 ?v10) (pred_1 ?v9) 
                  (pred_2 ?v10) (pred_6 ?v9))
:effect (and (pred_5 ) (pred_4 ?v9 ?v10) (not (pred_6 ?v9)))))


	
