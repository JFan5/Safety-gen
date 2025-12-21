(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_1
obj_08 obj_09 obj_04 obj_07 - type_2
obj_03 obj_11 obj_10 - type_3
obj_02 obj_01 - object)
(:init
(pred_1 obj_05 obj_10)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_09)
(pred_1 obj_06 obj_11)
(pred_3 obj_06 obj_04)
(pred_3 obj_06 obj_07)
(pred_2 obj_02 obj_11)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_02 obj_10)
(pred_2 obj_01 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_10) (pred_1 obj_06 obj_10))))
  )
)
)