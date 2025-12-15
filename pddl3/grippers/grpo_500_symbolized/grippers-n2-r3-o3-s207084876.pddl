(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_03 - type_1
obj_08 obj_09 obj_11 obj_10 - type_3
obj_07 obj_06 obj_01 - type_2
obj_02 obj_04 obj_12 - object)
(:init
(pred_3 obj_05 obj_06)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_09)
(pred_3 obj_03 obj_01)
(pred_4 obj_03 obj_11)
(pred_4 obj_03 obj_10)
(pred_2 obj_02 obj_07)
(pred_2 obj_04 obj_01)
(pred_2 obj_12 obj_07)
)
(:goal
(and
(pred_2 obj_02 obj_01)
(pred_2 obj_04 obj_07)
(pred_2 obj_12 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_01) (pred_3 obj_03 obj_01))))
  )
)
)