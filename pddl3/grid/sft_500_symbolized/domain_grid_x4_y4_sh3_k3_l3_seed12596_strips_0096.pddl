(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v13)
             (pred_3 ?v6 ?v2)
             (pred_9 ?v5 ?v2)
             (pred_10 ?v12 ?v5 )
	     (pred_5 ?v5)
             (pred_1 ?v11)
             (pred_11 ?v6)
             (pred_6 ?v2)
             (pred_8 ?v5)
             (pred_4 ?v6)
             (pred_12 ?v5)
             (pred_2 ))



(:action op_3
:parameters (?v7 ?v3 ?v1 ?v10)
:precondition (and (pred_1 ?v7) (pred_1 ?v3) (pred_11 ?v1) (pred_6 ?v10)
          (pred_7 ?v7 ?v3) (pred_3 ?v1 ?v10)
                   (pred_9 ?v3 ?v10) (pred_5 ?v7) 
                   (pred_8 ?v3) (pred_4 ?v1))
:effect (and  (pred_12 ?v3) (not (pred_8 ?v3))))


(:action op_5
:parameters (?v7 ?v4)
:precondition (and (pred_1 ?v7) (pred_1 ?v4)
               (pred_5 ?v7) (pred_7 ?v7 ?v4) (pred_12 ?v4))
:effect (and (pred_5 ?v4) (not (pred_5 ?v7))))

(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_1 ?v7) (pred_11 ?v1) 
                  (pred_5 ?v7) (pred_10 ?v1 ?v7) (pred_2 ))
:effect (and (pred_4 ?v1)
   (not (pred_10 ?v1 ?v7)) (not (pred_2 ))))


(:action op_1
:parameters (?v7 ?v8 ?v9)
:precondition (and (pred_1 ?v7) (pred_11 ?v8) (pred_11 ?v9)
                  (pred_5 ?v7) (pred_4 ?v9) (pred_10 ?v8 ?v7))
:effect (and (pred_4 ?v8) (pred_10 ?v9 ?v7)
        (not (pred_4 ?v9)) (not (pred_10 ?v8 ?v7))))

(:action op_4
:parameters (?v7 ?v1)
:precondition (and (pred_1 ?v7) (pred_11 ?v1) 
                  (pred_5 ?v7) (pred_4 ?v1))
:effect (and (pred_2 ) (pred_10 ?v1 ?v7) (not (pred_4 ?v1)))))


	
