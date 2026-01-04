(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_02 - type_1
obj_08 obj_12 obj_09 obj_04 - type_3
obj_11 obj_05 obj_06 - type_2
obj_07 obj_03 obj_01 - object)
(:init
(pred_3 obj_10 obj_06)
(pred_2 obj_10 obj_08)
(pred_2 obj_10 obj_12)
(pred_3 obj_02 obj_11)
(pred_2 obj_02 obj_09)
(pred_2 obj_02 obj_04)
(pred_1 obj_07 obj_11)
(pred_1 obj_03 obj_06)
(pred_1 obj_01 obj_11)
)
(:goal
(and
(pred_1 obj_07 obj_06)
(pred_1 obj_03 obj_11)
(pred_1 obj_01 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_10 obj_06) (pred_3 obj_02 obj_06))))
  )
)
)