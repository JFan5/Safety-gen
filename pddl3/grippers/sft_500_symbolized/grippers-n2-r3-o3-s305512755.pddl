(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_11 - type_2
obj_09 obj_02 obj_06 obj_08 - type_1
obj_07 obj_01 obj_03 - type_3
obj_05 obj_12 obj_10 - object)
(:init
(pred_3 obj_04 obj_01)
(pred_4 obj_04 obj_09)
(pred_4 obj_04 obj_02)
(pred_3 obj_11 obj_03)
(pred_4 obj_11 obj_06)
(pred_4 obj_11 obj_08)
(pred_2 obj_05 obj_01)
(pred_2 obj_12 obj_07)
(pred_2 obj_10 obj_07)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_12 obj_07)
(pred_2 obj_10 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_04 obj_03) (pred_3 obj_11 obj_03))))
  )
)
)