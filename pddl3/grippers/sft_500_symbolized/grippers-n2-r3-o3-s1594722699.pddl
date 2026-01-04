(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_07 - type_1
obj_08 obj_05 obj_11 obj_09 - type_3
obj_04 obj_10 obj_03 - type_2
obj_06 obj_12 obj_01 - object)
(:init
(pred_2 obj_02 obj_03)
(pred_3 obj_02 obj_08)
(pred_3 obj_02 obj_05)
(pred_2 obj_07 obj_10)
(pred_3 obj_07 obj_11)
(pred_3 obj_07 obj_09)
(pred_4 obj_06 obj_04)
(pred_4 obj_12 obj_04)
(pred_4 obj_01 obj_04)
)
(:goal
(and
(pred_4 obj_06 obj_04)
(pred_4 obj_12 obj_10)
(pred_4 obj_01 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_02 obj_10) (pred_2 obj_07 obj_10))))
  )
)
)