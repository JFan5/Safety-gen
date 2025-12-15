(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v6 ?v2)
             (pred_8 ?v4 ?v9)
             (pred_9 ?v6 ?v9)
             (pred_1 ?v12 ?v6 )
	     (pred_2 ?v6)
             (pred_10 ?v3)
             (pred_5 ?v4)
             (pred_11 ?v9)
             (pred_6 ?v6)
             (pred_4 ?v4)
             (pred_12 ?v6)
             (pred_7 ))



(:action op_4
:parameters (?v1 ?v13 ?v8 ?v5)
:precondition (and (pred_10 ?v1) (pred_10 ?v13) (pred_5 ?v8) (pred_11 ?v5)
          (pred_3 ?v1 ?v13) (pred_8 ?v8 ?v5)
                   (pred_9 ?v13 ?v5) (pred_2 ?v1) 
                   (pred_6 ?v13) (pred_4 ?v8))
:effect (and  (pred_12 ?v13) (not (pred_6 ?v13))))


(:action op_1
:parameters (?v1 ?v11)
:precondition (and (pred_10 ?v1) (pred_10 ?v11)
               (pred_2 ?v1) (pred_3 ?v1 ?v11) (pred_12 ?v11))
:effect (and (pred_2 ?v11) (not (pred_2 ?v1))))

(:action op_3
:parameters (?v1 ?v8)
:precondition (and (pred_10 ?v1) (pred_5 ?v8) 
                  (pred_2 ?v1) (pred_1 ?v8 ?v1) (pred_7 ))
:effect (and (pred_4 ?v8)
   (not (pred_1 ?v8 ?v1)) (not (pred_7 ))))


(:action op_2
:parameters (?v1 ?v10 ?v7)
:precondition (and (pred_10 ?v1) (pred_5 ?v10) (pred_5 ?v7)
                  (pred_2 ?v1) (pred_4 ?v7) (pred_1 ?v10 ?v1))
:effect (and (pred_4 ?v10) (pred_1 ?v7 ?v1)
        (not (pred_4 ?v7)) (not (pred_1 ?v10 ?v1))))

(:action op_5
:parameters (?v1 ?v8)
:precondition (and (pred_10 ?v1) (pred_5 ?v8) 
                  (pred_2 ?v1) (pred_4 ?v8))
:effect (and (pred_7 ) (pred_1 ?v8 ?v1) (not (pred_4 ?v8)))))


	
