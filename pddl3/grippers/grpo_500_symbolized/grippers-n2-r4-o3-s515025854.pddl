(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_01 - type_1
obj_11 obj_07 obj_09 obj_03 - type_3
obj_06 obj_08 obj_13 obj_10 - type_2
obj_04 obj_12 obj_02 - object)
(:init
(pred_3 obj_05 obj_10)
(pred_4 obj_05 obj_11)
(pred_4 obj_05 obj_07)
(pred_3 obj_01 obj_06)
(pred_4 obj_01 obj_09)
(pred_4 obj_01 obj_03)
(pred_2 obj_04 obj_08)
(pred_2 obj_12 obj_10)
(pred_2 obj_02 obj_10)
)
(:goal
(and
(pred_2 obj_04 obj_08)
(pred_2 obj_12 obj_06)
(pred_2 obj_02 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_06) (pred_3 obj_01 obj_06))))
  )
)
)