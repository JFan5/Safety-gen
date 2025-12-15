(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_11 - type_1
obj_04 obj_10 obj_02 obj_07 - type_3
obj_01 obj_09 obj_08 - type_2
obj_03 obj_06 obj_12 - object)
(:init
(pred_2 obj_05 obj_09)
(pred_3 obj_05 obj_04)
(pred_3 obj_05 obj_10)
(pred_2 obj_11 obj_01)
(pred_3 obj_11 obj_02)
(pred_3 obj_11 obj_07)
(pred_4 obj_03 obj_01)
(pred_4 obj_06 obj_08)
(pred_4 obj_12 obj_01)
)
(:goal
(and
(pred_4 obj_03 obj_09)
(pred_4 obj_06 obj_08)
(pred_4 obj_12 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_05 obj_09) (pred_2 obj_11 obj_09))))
  )
)
)