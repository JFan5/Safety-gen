(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_13 - type_1
obj_08 obj_12 obj_11 obj_09 - type_3
obj_04 obj_05 obj_10 obj_01 - type_2
obj_06 obj_03 obj_02 - object)
(:init
(pred_3 obj_07 obj_04)
(pred_4 obj_07 obj_08)
(pred_4 obj_07 obj_12)
(pred_3 obj_13 obj_10)
(pred_4 obj_13 obj_11)
(pred_4 obj_13 obj_09)
(pred_2 obj_06 obj_10)
(pred_2 obj_03 obj_01)
(pred_2 obj_02 obj_10)
)
(:goal
(and
(pred_2 obj_06 obj_10)
(pred_2 obj_03 obj_10)
(pred_2 obj_02 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_07 obj_01) (pred_3 obj_13 obj_01))))
  )
)
)