(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_12 - type_1
obj_08 obj_10 obj_06 obj_04 - type_3
obj_11 obj_07 obj_01 obj_02 - type_2
obj_03 obj_05 obj_09 - object)
(:init
(pred_3 obj_13 obj_11)
(pred_4 obj_13 obj_08)
(pred_4 obj_13 obj_10)
(pred_3 obj_12 obj_07)
(pred_4 obj_12 obj_06)
(pred_4 obj_12 obj_04)
(pred_2 obj_03 obj_01)
(pred_2 obj_05 obj_01)
(pred_2 obj_09 obj_07)
)
(:goal
(and
(pred_2 obj_03 obj_11)
(pred_2 obj_05 obj_11)
(pred_2 obj_09 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_13 obj_01) (pred_3 obj_12 obj_01))))
  )
)
)