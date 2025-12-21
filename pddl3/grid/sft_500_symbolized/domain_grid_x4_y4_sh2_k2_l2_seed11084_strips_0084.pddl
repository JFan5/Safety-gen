(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v6 ?v13)
             (pred_8 ?v1 ?v10)
             (pred_5 ?v6 ?v10)
             (pred_4 ?v2 ?v6 )
	     (pred_6 ?v6)
             (pred_3 ?v8)
             (pred_1 ?v1)
             (pred_11 ?v10)
             (pred_12 ?v6)
             (pred_7 ?v1)
             (pred_2 ?v6)
             (pred_9 ))



(:action op_5
:parameters (?v7 ?v12 ?v4 ?v3)
:precondition (and (pred_3 ?v7) (pred_3 ?v12) (pred_1 ?v4) (pred_11 ?v3)
          (pred_10 ?v7 ?v12) (pred_8 ?v4 ?v3)
                   (pred_5 ?v12 ?v3) (pred_6 ?v7) 
                   (pred_12 ?v12) (pred_7 ?v4))
:effect (and  (pred_2 ?v12) (not (pred_12 ?v12))))


(:action op_3
:parameters (?v7 ?v11)
:precondition (and (pred_3 ?v7) (pred_3 ?v11)
               (pred_6 ?v7) (pred_10 ?v7 ?v11) (pred_2 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v7))))

(:action op_1
:parameters (?v7 ?v4)
:precondition (and (pred_3 ?v7) (pred_1 ?v4) 
                  (pred_6 ?v7) (pred_4 ?v4 ?v7) (pred_9 ))
:effect (and (pred_7 ?v4)
   (not (pred_4 ?v4 ?v7)) (not (pred_9 ))))


(:action op_2
:parameters (?v7 ?v5 ?v9)
:precondition (and (pred_3 ?v7) (pred_1 ?v5) (pred_1 ?v9)
                  (pred_6 ?v7) (pred_7 ?v9) (pred_4 ?v5 ?v7))
:effect (and (pred_7 ?v5) (pred_4 ?v9 ?v7)
        (not (pred_7 ?v9)) (not (pred_4 ?v5 ?v7))))

(:action op_4
:parameters (?v7 ?v4)
:precondition (and (pred_3 ?v7) (pred_1 ?v4) 
                  (pred_6 ?v7) (pred_7 ?v4))
:effect (and (pred_9 ) (pred_4 ?v4 ?v7) (not (pred_7 ?v4)))))


	
