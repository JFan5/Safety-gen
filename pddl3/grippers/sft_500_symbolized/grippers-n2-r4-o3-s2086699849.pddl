(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_11 - type_3
obj_03 obj_04 obj_06 obj_05 - type_2
obj_01 obj_08 obj_09 obj_10 - type_1
obj_12 obj_07 obj_02 - object)
(:init
(pred_3 obj_13 obj_08)
(pred_1 obj_13 obj_03)
(pred_1 obj_13 obj_04)
(pred_3 obj_11 obj_09)
(pred_1 obj_11 obj_06)
(pred_1 obj_11 obj_05)
(pred_4 obj_12 obj_10)
(pred_4 obj_07 obj_10)
(pred_4 obj_02 obj_10)
)
(:goal
(and
(pred_4 obj_12 obj_08)
(pred_4 obj_07 obj_08)
(pred_4 obj_02 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_13 obj_10) (pred_3 obj_11 obj_10))))
  )
)
)