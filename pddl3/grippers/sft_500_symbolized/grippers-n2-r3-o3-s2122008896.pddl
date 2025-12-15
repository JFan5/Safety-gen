(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_1
obj_12 obj_05 obj_04 obj_01 - type_2
obj_09 obj_06 obj_07 - type_3
obj_11 obj_02 obj_03 - object)
(:init
(pred_2 obj_10 obj_06)
(pred_3 obj_10 obj_12)
(pred_3 obj_10 obj_05)
(pred_2 obj_08 obj_07)
(pred_3 obj_08 obj_04)
(pred_3 obj_08 obj_01)
(pred_4 obj_11 obj_06)
(pred_4 obj_02 obj_09)
(pred_4 obj_03 obj_06)
)
(:goal
(and
(pred_4 obj_11 obj_09)
(pred_4 obj_02 obj_07)
(pred_4 obj_03 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_10 obj_09) (pred_2 obj_08 obj_09))))
  )
)
)