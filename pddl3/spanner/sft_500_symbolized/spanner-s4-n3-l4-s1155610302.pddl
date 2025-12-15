; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1155610302 --problem-name spanner-s4-n3-l4-s1155610302
(define (problem spanner-s4-n3-l4-s1155610302)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_11 obj_04 obj_10 obj_09 - type_2
     obj_05 obj_01 obj_14 - type_5
     obj_06 obj_02 obj_03 obj_13 - type_3
     obj_07 obj_12 - type_3
    )
 (:init 
    (pred_6 obj_08 obj_07)
    (pred_6 obj_11 obj_02)
    (pred_4 obj_11)
    (pred_6 obj_04 obj_06)
    (pred_4 obj_04)
    (pred_6 obj_10 obj_03)
    (pred_4 obj_10)
    (pred_6 obj_09 obj_03)
    (pred_4 obj_09)
    (pred_1 obj_05)
    (pred_6 obj_05 obj_12)
    (pred_1 obj_01)
    (pred_6 obj_01 obj_12)
    (pred_1 obj_14)
    (pred_6 obj_14 obj_12)
    (pred_5 obj_07 obj_06)
    (pred_5 obj_13 obj_12)
    (pred_5 obj_06 obj_02)
    (pred_5 obj_02 obj_03)
    (pred_5 obj_03 obj_13)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_01)
   (pred_2 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
