(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_03 - type_1
obj_08 obj_09 obj_10 obj_02 - type_2
obj_04 obj_07 obj_01 - type_3
obj_11 obj_06 obj_12 - object)
(:init
(pred_1 obj_05 obj_01)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_09)
(pred_1 obj_03 obj_07)
(pred_4 obj_03 obj_10)
(pred_4 obj_03 obj_02)
(pred_2 obj_11 obj_07)
(pred_2 obj_06 obj_01)
(pred_2 obj_12 obj_07)
)
(:goal
(and
(pred_2 obj_11 obj_01)
(pred_2 obj_06 obj_07)
(pred_2 obj_12 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_01) (pred_1 obj_03 obj_01))))
  )
)
)