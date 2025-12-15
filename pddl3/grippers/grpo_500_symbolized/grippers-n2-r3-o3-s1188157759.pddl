(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_1
obj_10 obj_06 obj_01 obj_08 - type_3
obj_07 obj_12 obj_09 - type_2
obj_05 obj_11 obj_03 - object)
(:init
(pred_3 obj_02 obj_09)
(pred_4 obj_02 obj_10)
(pred_4 obj_02 obj_06)
(pred_3 obj_04 obj_12)
(pred_4 obj_04 obj_01)
(pred_4 obj_04 obj_08)
(pred_2 obj_05 obj_09)
(pred_2 obj_11 obj_09)
(pred_2 obj_03 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_12)
(pred_2 obj_11 obj_12)
(pred_2 obj_03 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_02 obj_09) (pred_3 obj_04 obj_09))))
  )
)
)