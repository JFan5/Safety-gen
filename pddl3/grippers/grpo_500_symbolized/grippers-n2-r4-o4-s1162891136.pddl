(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_1
obj_03 obj_12 obj_06 obj_01 - type_3
obj_02 obj_14 obj_07 obj_04 - type_2
obj_13 obj_08 obj_09 obj_05 - object)
(:init
(pred_4 obj_10 obj_04)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_12)
(pred_4 obj_11 obj_14)
(pred_2 obj_11 obj_06)
(pred_2 obj_11 obj_01)
(pred_3 obj_13 obj_14)
(pred_3 obj_08 obj_07)
(pred_3 obj_09 obj_04)
(pred_3 obj_05 obj_07)
)
(:goal
(and
(pred_3 obj_13 obj_02)
(pred_3 obj_08 obj_04)
(pred_3 obj_09 obj_14)
(pred_3 obj_05 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_14) (pred_4 obj_11 obj_14))))
  )
)
)