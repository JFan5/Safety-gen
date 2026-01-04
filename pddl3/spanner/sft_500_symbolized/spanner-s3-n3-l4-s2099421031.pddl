; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2099421031 --problem-name spanner-s3-n3-l4-s2099421031
(define (problem spanner-s3-n3-l4-s2099421031)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_10 obj_05 obj_08 - type_5
     obj_12 obj_01 obj_07 - type_2
     obj_09 obj_02 obj_06 obj_13 - type_1
     obj_04 obj_03 - type_1
    )
 (:init 
    (pred_5 obj_11 obj_04)
    (pred_5 obj_10 obj_09)
    (pred_6 obj_10)
    (pred_5 obj_05 obj_02)
    (pred_6 obj_05)
    (pred_5 obj_08 obj_06)
    (pred_6 obj_08)
    (pred_4 obj_12)
    (pred_5 obj_12 obj_03)
    (pred_4 obj_01)
    (pred_5 obj_01 obj_03)
    (pred_4 obj_07)
    (pred_5 obj_07 obj_03)
    (pred_2 obj_04 obj_09)
    (pred_2 obj_13 obj_03)
    (pred_2 obj_09 obj_02)
    (pred_2 obj_02 obj_06)
    (pred_2 obj_06 obj_13)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_01)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
