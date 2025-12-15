(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_2
obj_12 obj_03 obj_09 obj_11 - type_3
obj_14 obj_02 obj_08 obj_07 - type_1
obj_10 obj_01 obj_13 obj_06 - object)
(:init
(pred_2 obj_05 obj_08)
(pred_4 obj_05 obj_12)
(pred_4 obj_05 obj_03)
(pred_2 obj_04 obj_07)
(pred_4 obj_04 obj_09)
(pred_4 obj_04 obj_11)
(pred_3 obj_10 obj_08)
(pred_3 obj_01 obj_14)
(pred_3 obj_13 obj_02)
(pred_3 obj_06 obj_08)
)
(:goal
(and
(pred_3 obj_10 obj_07)
(pred_3 obj_01 obj_02)
(pred_3 obj_13 obj_02)
(pred_3 obj_06 obj_14)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_05 obj_14) (pred_2 obj_04 obj_14))))
  )
)
)