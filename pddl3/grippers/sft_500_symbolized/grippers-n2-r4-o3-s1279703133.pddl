(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_2
obj_04 obj_09 obj_03 obj_13 - type_1
obj_05 obj_12 obj_06 obj_08 - type_3
obj_10 obj_02 obj_07 - object)
(:init
(pred_2 obj_11 obj_06)
(pred_4 obj_11 obj_04)
(pred_4 obj_11 obj_09)
(pred_2 obj_01 obj_08)
(pred_4 obj_01 obj_03)
(pred_4 obj_01 obj_13)
(pred_3 obj_10 obj_06)
(pred_3 obj_02 obj_12)
(pred_3 obj_07 obj_05)
)
(:goal
(and
(pred_3 obj_10 obj_08)
(pred_3 obj_02 obj_12)
(pred_3 obj_07 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_11 obj_08) (pred_2 obj_01 obj_08))))
  )
)
)