(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v11 ?v10)
             (pred_4 ?v9 ?v2)
             (pred_9 ?v11 ?v2)
             (pred_5 ?v12 ?v11 )
	     (pred_1 ?v11)
             (pred_8 ?v3)
             (pred_3 ?v9)
             (pred_7 ?v2)
             (pred_12 ?v11)
             (pred_11 ?v9)
             (pred_6 ?v11)
             (pred_10 ))



(:action op_3
:parameters (?v7 ?v6 ?v1 ?v4)
:precondition (and (pred_8 ?v7) (pred_8 ?v6) (pred_3 ?v1) (pred_7 ?v4)
          (pred_2 ?v7 ?v6) (pred_4 ?v1 ?v4)
                   (pred_9 ?v6 ?v4) (pred_1 ?v7) 
                   (pred_12 ?v6) (pred_11 ?v1))
:effect (and  (pred_6 ?v6) (not (pred_12 ?v6))))


(:action op_2
:parameters (?v7 ?v5)
:precondition (and (pred_8 ?v7) (pred_8 ?v5)
               (pred_1 ?v7) (pred_2 ?v7 ?v5) (pred_6 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v7))))

(:action op_1
:parameters (?v7 ?v1)
:precondition (and (pred_8 ?v7) (pred_3 ?v1) 
                  (pred_1 ?v7) (pred_5 ?v1 ?v7) (pred_10 ))
:effect (and (pred_11 ?v1)
   (not (pred_5 ?v1 ?v7)) (not (pred_10 ))))


(:action op_5
:parameters (?v7 ?v13 ?v8)
:precondition (and (pred_8 ?v7) (pred_3 ?v13) (pred_3 ?v8)
                  (pred_1 ?v7) (pred_11 ?v8) (pred_5 ?v13 ?v7))
:effect (and (pred_11 ?v13) (pred_5 ?v8 ?v7)
        (not (pred_11 ?v8)) (not (pred_5 ?v13 ?v7))))

(:action op_4
:parameters (?v7 ?v1)
:precondition (and (pred_8 ?v7) (pred_3 ?v1) 
                  (pred_1 ?v7) (pred_11 ?v1))
:effect (and (pred_10 ) (pred_5 ?v1 ?v7) (not (pred_11 ?v1)))))


	
