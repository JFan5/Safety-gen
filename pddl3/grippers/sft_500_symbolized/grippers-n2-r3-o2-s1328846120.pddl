(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_1
obj_02 obj_04 obj_08 obj_09 - type_2
obj_11 obj_05 obj_06 - type_3
obj_01 obj_07 - object)
(:init
(pred_1 obj_10 obj_06)
(pred_3 obj_10 obj_02)
(pred_3 obj_10 obj_04)
(pred_1 obj_03 obj_11)
(pred_3 obj_03 obj_08)
(pred_3 obj_03 obj_09)
(pred_2 obj_01 obj_06)
(pred_2 obj_07 obj_11)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_07 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_06) (pred_1 obj_03 obj_06))))
  )
)
)