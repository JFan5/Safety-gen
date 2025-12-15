(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_1
obj_04 obj_01 obj_07 obj_08 - type_3
obj_06 obj_13 obj_09 obj_02 - type_2
obj_12 obj_10 obj_05 - object)
(:init
(pred_3 obj_11 obj_06)
(pred_4 obj_11 obj_04)
(pred_4 obj_11 obj_01)
(pred_3 obj_03 obj_13)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_08)
(pred_2 obj_12 obj_09)
(pred_2 obj_10 obj_02)
(pred_2 obj_05 obj_13)
)
(:goal
(and
(pred_2 obj_12 obj_13)
(pred_2 obj_10 obj_02)
(pred_2 obj_05 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_09) (pred_3 obj_03 obj_09))))
  )
)
)