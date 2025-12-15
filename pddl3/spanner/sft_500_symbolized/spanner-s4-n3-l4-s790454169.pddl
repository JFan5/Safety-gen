; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 790454169 --problem-name spanner-s4-n3-l4-s790454169
(define (problem spanner-s4-n3-l4-s790454169)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_14 obj_07 obj_01 obj_12 - type_3
     obj_05 obj_06 obj_09 - type_5
     obj_08 obj_02 obj_10 obj_03 - type_4
     obj_13 obj_11 - type_4
    )
 (:init 
    (pred_3 obj_04 obj_13)
    (pred_3 obj_14 obj_08)
    (pred_2 obj_14)
    (pred_3 obj_07 obj_08)
    (pred_2 obj_07)
    (pred_3 obj_01 obj_10)
    (pred_2 obj_01)
    (pred_3 obj_12 obj_08)
    (pred_2 obj_12)
    (pred_4 obj_05)
    (pred_3 obj_05 obj_11)
    (pred_4 obj_06)
    (pred_3 obj_06 obj_11)
    (pred_4 obj_09)
    (pred_3 obj_09 obj_11)
    (pred_1 obj_13 obj_08)
    (pred_1 obj_03 obj_11)
    (pred_1 obj_08 obj_02)
    (pred_1 obj_02 obj_10)
    (pred_1 obj_10 obj_03)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_06)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_13)))
  )
)
)
