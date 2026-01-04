; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1155610302 --problem-name spanner-s4-n3-l4-s1155610302
(define (problem spanner-s4-n3-l4-s1155610302)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_10 obj_13 obj_07 obj_12 - type_1
     obj_09 obj_02 obj_11 - type_5
     obj_05 obj_08 obj_01 obj_03 - type_2
     obj_04 obj_14 - type_2
    )
 (:init 
    (pred_1 obj_06 obj_04)
    (pred_1 obj_10 obj_08)
    (pred_4 obj_10)
    (pred_1 obj_13 obj_05)
    (pred_4 obj_13)
    (pred_1 obj_07 obj_01)
    (pred_4 obj_07)
    (pred_1 obj_12 obj_01)
    (pred_4 obj_12)
    (pred_6 obj_09)
    (pred_1 obj_09 obj_14)
    (pred_6 obj_02)
    (pred_1 obj_02 obj_14)
    (pred_6 obj_11)
    (pred_1 obj_11 obj_14)
    (pred_2 obj_04 obj_05)
    (pred_2 obj_03 obj_14)
    (pred_2 obj_05 obj_08)
    (pred_2 obj_08 obj_01)
    (pred_2 obj_01 obj_03)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_02)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
