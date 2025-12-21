(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v2 ?v1)
             (pred_4 ?v12 ?v9)
             (pred_8 ?v2 ?v9)
             (pred_12 ?v5 ?v2 )
	     (pred_1 ?v2)
             (pred_2 ?v6)
             (pred_3 ?v12)
             (pred_9 ?v9)
             (pred_10 ?v2)
             (pred_6 ?v12)
             (pred_5 ?v2)
             (pred_7 ))



(:action op_1
:parameters (?v13 ?v7 ?v3 ?v10)
:precondition (and (pred_2 ?v13) (pred_2 ?v7) (pred_3 ?v3) (pred_9 ?v10)
          (pred_11 ?v13 ?v7) (pred_4 ?v3 ?v10)
                   (pred_8 ?v7 ?v10) (pred_1 ?v13) 
                   (pred_10 ?v7) (pred_6 ?v3))
:effect (and  (pred_5 ?v7) (not (pred_10 ?v7))))


(:action op_2
:parameters (?v13 ?v4)
:precondition (and (pred_2 ?v13) (pred_2 ?v4)
               (pred_1 ?v13) (pred_11 ?v13 ?v4) (pred_5 ?v4))
:effect (and (pred_1 ?v4) (not (pred_1 ?v13))))

(:action op_5
:parameters (?v13 ?v3)
:precondition (and (pred_2 ?v13) (pred_3 ?v3) 
                  (pred_1 ?v13) (pred_12 ?v3 ?v13) (pred_7 ))
:effect (and (pred_6 ?v3)
   (not (pred_12 ?v3 ?v13)) (not (pred_7 ))))


(:action op_4
:parameters (?v13 ?v8 ?v11)
:precondition (and (pred_2 ?v13) (pred_3 ?v8) (pred_3 ?v11)
                  (pred_1 ?v13) (pred_6 ?v11) (pred_12 ?v8 ?v13))
:effect (and (pred_6 ?v8) (pred_12 ?v11 ?v13)
        (not (pred_6 ?v11)) (not (pred_12 ?v8 ?v13))))

(:action op_3
:parameters (?v13 ?v3)
:precondition (and (pred_2 ?v13) (pred_3 ?v3) 
                  (pred_1 ?v13) (pred_6 ?v3))
:effect (and (pred_7 ) (pred_12 ?v3 ?v13) (not (pred_6 ?v3)))))


	
