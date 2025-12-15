; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1455253135 --problem-name spanner-s3-n2-l4-s1455253135
(define (problem spanner-s3-n2-l4-s1455253135)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_11 obj_05 obj_10 - type_5
     obj_03 obj_04 - type_2
     obj_02 obj_09 obj_08 obj_01 - type_3
     obj_07 obj_12 - type_3
    )
 (:init 
    (pred_3 obj_06 obj_07)
    (pred_3 obj_11 obj_01)
    (pred_5 obj_11)
    (pred_3 obj_05 obj_02)
    (pred_5 obj_05)
    (pred_3 obj_10 obj_01)
    (pred_5 obj_10)
    (pred_2 obj_03)
    (pred_3 obj_03 obj_12)
    (pred_2 obj_04)
    (pred_3 obj_04 obj_12)
    (pred_1 obj_07 obj_02)
    (pred_1 obj_01 obj_12)
    (pred_1 obj_02 obj_09)
    (pred_1 obj_09 obj_08)
    (pred_1 obj_08 obj_01)
)
 (:goal
  (and
   (pred_6 obj_03)
   (pred_6 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_03)) (not (pred_6 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
