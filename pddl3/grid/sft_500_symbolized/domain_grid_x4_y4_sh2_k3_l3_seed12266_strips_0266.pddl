(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v9 ?v5)
             (pred_9 ?v4 ?v10)
             (pred_4 ?v9 ?v10)
             (pred_7 ?v8 ?v9 )
	     (pred_8 ?v9)
             (pred_3 ?v2)
             (pred_10 ?v4)
             (pred_1 ?v10)
             (pred_5 ?v9)
             (pred_6 ?v4)
             (pred_12 ?v9)
             (pred_11 ))



(:action op_3
:parameters (?v7 ?v12 ?v1 ?v3)
:precondition (and (pred_3 ?v7) (pred_3 ?v12) (pred_10 ?v1) (pred_1 ?v3)
          (pred_2 ?v7 ?v12) (pred_9 ?v1 ?v3)
                   (pred_4 ?v12 ?v3) (pred_8 ?v7) 
                   (pred_5 ?v12) (pred_6 ?v1))
:effect (and  (pred_12 ?v12) (not (pred_5 ?v12))))


(:action op_4
:parameters (?v7 ?v11)
:precondition (and (pred_3 ?v7) (pred_3 ?v11)
               (pred_8 ?v7) (pred_2 ?v7 ?v11) (pred_12 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v7))))

(:action op_1
:parameters (?v7 ?v1)
:precondition (and (pred_3 ?v7) (pred_10 ?v1) 
                  (pred_8 ?v7) (pred_7 ?v1 ?v7) (pred_11 ))
:effect (and (pred_6 ?v1)
   (not (pred_7 ?v1 ?v7)) (not (pred_11 ))))


(:action op_5
:parameters (?v7 ?v13 ?v6)
:precondition (and (pred_3 ?v7) (pred_10 ?v13) (pred_10 ?v6)
                  (pred_8 ?v7) (pred_6 ?v6) (pred_7 ?v13 ?v7))
:effect (and (pred_6 ?v13) (pred_7 ?v6 ?v7)
        (not (pred_6 ?v6)) (not (pred_7 ?v13 ?v7))))

(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_3 ?v7) (pred_10 ?v1) 
                  (pred_8 ?v7) (pred_6 ?v1))
:effect (and (pred_11 ) (pred_7 ?v1 ?v7) (not (pred_6 ?v1)))))


	
