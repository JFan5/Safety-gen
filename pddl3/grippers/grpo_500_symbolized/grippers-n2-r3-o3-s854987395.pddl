(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_1
obj_02 obj_08 obj_05 obj_01 - type_3
obj_07 obj_06 obj_09 - type_2
obj_12 obj_03 obj_04 - object)
(:init
(pred_4 obj_10 obj_06)
(pred_2 obj_10 obj_02)
(pred_2 obj_10 obj_08)
(pred_4 obj_11 obj_07)
(pred_2 obj_11 obj_05)
(pred_2 obj_11 obj_01)
(pred_3 obj_12 obj_07)
(pred_3 obj_03 obj_09)
(pred_3 obj_04 obj_07)
)
(:goal
(and
(pred_3 obj_12 obj_09)
(pred_3 obj_03 obj_07)
(pred_3 obj_04 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_09) (pred_4 obj_11 obj_09))))
  )
)
)