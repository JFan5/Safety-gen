(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v13)
             (pred_7 ?v10 ?v12)
             (pred_11 ?v2 ?v12)
             (pred_5 ?v3 ?v2 )
	     (pred_3 ?v2)
             (pred_1 ?v11)
             (pred_4 ?v10)
             (pred_2 ?v12)
             (pred_8 ?v2)
             (pred_6 ?v10)
             (pred_10 ?v2)
             (pred_12 ))



(:action op_4
:parameters (?v1 ?v7 ?v9 ?v6)
:precondition (and (pred_1 ?v1) (pred_1 ?v7) (pred_4 ?v9) (pred_2 ?v6)
          (pred_9 ?v1 ?v7) (pred_7 ?v9 ?v6)
                   (pred_11 ?v7 ?v6) (pred_3 ?v1) 
                   (pred_8 ?v7) (pred_6 ?v9))
:effect (and  (pred_10 ?v7) (not (pred_8 ?v7))))


(:action op_3
:parameters (?v1 ?v8)
:precondition (and (pred_1 ?v1) (pred_1 ?v8)
               (pred_3 ?v1) (pred_9 ?v1 ?v8) (pred_10 ?v8))
:effect (and (pred_3 ?v8) (not (pred_3 ?v1))))

(:action op_5
:parameters (?v1 ?v9)
:precondition (and (pred_1 ?v1) (pred_4 ?v9) 
                  (pred_3 ?v1) (pred_5 ?v9 ?v1) (pred_12 ))
:effect (and (pred_6 ?v9)
   (not (pred_5 ?v9 ?v1)) (not (pred_12 ))))


(:action op_1
:parameters (?v1 ?v4 ?v5)
:precondition (and (pred_1 ?v1) (pred_4 ?v4) (pred_4 ?v5)
                  (pred_3 ?v1) (pred_6 ?v5) (pred_5 ?v4 ?v1))
:effect (and (pred_6 ?v4) (pred_5 ?v5 ?v1)
        (not (pred_6 ?v5)) (not (pred_5 ?v4 ?v1))))

(:action op_2
:parameters (?v1 ?v9)
:precondition (and (pred_1 ?v1) (pred_4 ?v9) 
                  (pred_3 ?v1) (pred_6 ?v9))
:effect (and (pred_12 ) (pred_5 ?v9 ?v1) (not (pred_6 ?v9)))))


	
