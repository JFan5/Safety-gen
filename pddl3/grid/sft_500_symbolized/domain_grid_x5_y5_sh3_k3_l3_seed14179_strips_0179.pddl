(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v12)
             (pred_11 ?v8 ?v2)
             (pred_2 ?v4 ?v2)
             (pred_7 ?v5 ?v4 )
	     (pred_12 ?v4)
             (pred_1 ?v13)
             (pred_6 ?v8)
             (pred_9 ?v2)
             (pred_10 ?v4)
             (pred_3 ?v8)
             (pred_4 ?v4)
             (pred_8 ))



(:action op_4
:parameters (?v7 ?v1 ?v3 ?v10)
:precondition (and (pred_1 ?v7) (pred_1 ?v1) (pred_6 ?v3) (pred_9 ?v10)
          (pred_5 ?v7 ?v1) (pred_11 ?v3 ?v10)
                   (pred_2 ?v1 ?v10) (pred_12 ?v7) 
                   (pred_10 ?v1) (pred_3 ?v3))
:effect (and  (pred_4 ?v1) (not (pred_10 ?v1))))


(:action op_1
:parameters (?v7 ?v11)
:precondition (and (pred_1 ?v7) (pred_1 ?v11)
               (pred_12 ?v7) (pred_5 ?v7 ?v11) (pred_4 ?v11))
:effect (and (pred_12 ?v11) (not (pred_12 ?v7))))

(:action op_5
:parameters (?v7 ?v3)
:precondition (and (pred_1 ?v7) (pred_6 ?v3) 
                  (pred_12 ?v7) (pred_7 ?v3 ?v7) (pred_8 ))
:effect (and (pred_3 ?v3)
   (not (pred_7 ?v3 ?v7)) (not (pred_8 ))))


(:action op_3
:parameters (?v7 ?v9 ?v6)
:precondition (and (pred_1 ?v7) (pred_6 ?v9) (pred_6 ?v6)
                  (pred_12 ?v7) (pred_3 ?v6) (pred_7 ?v9 ?v7))
:effect (and (pred_3 ?v9) (pred_7 ?v6 ?v7)
        (not (pred_3 ?v6)) (not (pred_7 ?v9 ?v7))))

(:action op_2
:parameters (?v7 ?v3)
:precondition (and (pred_1 ?v7) (pred_6 ?v3) 
                  (pred_12 ?v7) (pred_3 ?v3))
:effect (and (pred_8 ) (pred_7 ?v3 ?v7) (not (pred_3 ?v3)))))


	
