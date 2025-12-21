(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v1)
             (pred_9 ?v7 ?v12)
             (pred_6 ?v6 ?v12)
             (pred_5 ?v5 ?v6 )
	     (pred_1 ?v6)
             (pred_11 ?v2)
             (pred_4 ?v7)
             (pred_8 ?v12)
             (pred_12 ?v6)
             (pred_2 ?v7)
             (pred_10 ?v6)
             (pred_3 ))



(:action op_3
:parameters (?v4 ?v13 ?v8 ?v3)
:precondition (and (pred_11 ?v4) (pred_11 ?v13) (pred_4 ?v8) (pred_8 ?v3)
          (pred_7 ?v4 ?v13) (pred_9 ?v8 ?v3)
                   (pred_6 ?v13 ?v3) (pred_1 ?v4) 
                   (pred_12 ?v13) (pred_2 ?v8))
:effect (and  (pred_10 ?v13) (not (pred_12 ?v13))))


(:action op_5
:parameters (?v4 ?v10)
:precondition (and (pred_11 ?v4) (pred_11 ?v10)
               (pred_1 ?v4) (pred_7 ?v4 ?v10) (pred_10 ?v10))
:effect (and (pred_1 ?v10) (not (pred_1 ?v4))))

(:action op_4
:parameters (?v4 ?v8)
:precondition (and (pred_11 ?v4) (pred_4 ?v8) 
                  (pred_1 ?v4) (pred_5 ?v8 ?v4) (pred_3 ))
:effect (and (pred_2 ?v8)
   (not (pred_5 ?v8 ?v4)) (not (pred_3 ))))


(:action op_1
:parameters (?v4 ?v11 ?v9)
:precondition (and (pred_11 ?v4) (pred_4 ?v11) (pred_4 ?v9)
                  (pred_1 ?v4) (pred_2 ?v9) (pred_5 ?v11 ?v4))
:effect (and (pred_2 ?v11) (pred_5 ?v9 ?v4)
        (not (pred_2 ?v9)) (not (pred_5 ?v11 ?v4))))

(:action op_2
:parameters (?v4 ?v8)
:precondition (and (pred_11 ?v4) (pred_4 ?v8) 
                  (pred_1 ?v4) (pred_2 ?v8))
:effect (and (pred_3 ) (pred_5 ?v8 ?v4) (not (pred_2 ?v8)))))


	
